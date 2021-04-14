import 'dart:collection';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

// Finds a path between two points.
class Pathfinder
{
  // All of the text in our nodes file.
  String _fileText;

  // Our current index in the nodes file.
  int _fileIndex;

  // An indexed list of the nodes in our graph.
  List<Node> _nodes;

  List<Node> _bestPath;

  HashMap<String, int> _roomNames;

  Pathfinder()
  {
    rootBundle.loadString('assets/nodes.txt').then((String val) {
      _fileText = val;
      _fileIndex = 0;

      _nodes = List.filled(_readInt(), null);
      _roomNames = new HashMap();

      // Create every node.
      for (int index = 0; index < _nodes.length; index++)
        {
          int key = _readInt();
          String text = "";
          String val = _readString();
          double x = -1, y = -1;

          // We have a name for this node.
          try {
            x = double.parse(val); // Will throw an error if this is a room name
            y = _readDouble();
          } on FormatException {
            // val is a room name, not a location.
            text = val;
            x = _readDouble();
            y = _readDouble();

            _roomNames[text] = key;
          }
          _nodes[index] = new Node(key, text, x, y);
        }

      // Connect nodes
      bool reading = true;
      while (reading)
        {
          try {
            int a = _readInt(),
                b = _readInt();

            _nodes[a].connect(_nodes[b]);
            _nodes[b].connect(_nodes[a]);
          } on FormatException {
            // We read a $ instead of a number.
            reading = false;
          }
        }

      // print("A: " + pathFind("A935", "A936").toString());
    });
  }

  // Reads a string from the file using the space key ' ' as a delimiter.
  String _readString()
  {
    if (_fileIndex >= _fileText.length)
      return "";

    while (_fileIndex < _fileText.length && _fileText[_fileIndex] == '\n')
    {
      _fileIndex++;
    }

    String read = "";
    while (_fileIndex < _fileText.length &&
           _fileText[_fileIndex] != ' ' &&
           _fileText[_fileIndex] != '\n')
    {
      // Don't add new lines to our string.
      if (_fileText[_fileIndex] != '\n')
      {
        read += _fileText[_fileIndex];
      }
      _fileIndex++;
    }

    // To start on next non-space character.
    _fileIndex++;

    if (read == "") read = _readString();
    return read;
  }

  // Reads an int from the file.
  int _readInt()
  {
    return int.parse(_readString());
  }

  // Reads a double from the file.
  double _readDouble()
  {
    return double.parse(_readString());
  }

  // Returns a list of nodes from our starting point to the room name.
  List<Node> pathFind(String start, String destination)
  {
    if (!_roomNames.containsKey(start) || !_roomNames.containsKey(destination))
    {
      return null;
    }

    HashMap<int, double> visitedDistances = new HashMap<int, double>();
    visitedDistances[_nodes[0].key] = 0;

    List<Node> path = List.empty(growable: true);
    path.add(_nodes[0]);

    _bestPath = List.empty(growable: true);
    _pathFind(_roomNames[destination], _nodes[0], // TODO: _nodes[_roomNames[start]],
        visitedDistances, path);

    return _bestPath;
  }

  void _pathFind(int destinationKey, Node current, HashMap<int, double> visited,
      List<Node> path)
  {
    if (current.key == destinationKey) return; // Path already found.

    for (int index = 0; index < current._connectors.length; index++)
    {
      // Foreach connector
      Node node = current._connectors[index];

      double newDist = current.distance(node) + visited[current.key];
      if (!visited.containsKey(node.key) || visited[node.key] > newDist)
      {
        visited[node.key] = newDist;
        path.add(node);
        _pathFind(destinationKey, node, visited, path);
        if (path.last.key == destinationKey)
        {
          // Clone the path.
          _bestPath = List.filled(path.length, null);
          for (int cloneIndex = 0; cloneIndex < path.length; cloneIndex++)
          {
            _bestPath[cloneIndex] = path[cloneIndex];
          }
        }
        path.remove(node);
      }
    }
  }
}

//
class Node
{
  // Nodes we can reach from our own.
  List<Node> _connectors;

  // Unique int representing us.
  int key;

  // Our pixel coordinates on the map.
  double x, y;

  // The name of our room (if applicable).
  String text;

  // Creates a new node given a unique key to represent us, the name of the room
  // we're on (if we're on a room), and our pixel coordinates on the map.
  Node(this.key, this.text, this.x, this.y)
  {
    _connectors = new List.empty(growable: true);
  }

  // Returns the distance between the pixel coordinates of us and the given
  // node.
  double distance(Node other)
  {
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2));
  }

  // Connects us to the other node. Note: this connection is directed.
  void connect(Node other)
  {
    _connectors.add(other);
  }

  @override
  String toString()
  {
    return key.toString();
    //return key.toString() + ", (" + x.toString() + ", " + y.toString() + ")";
  }
}