# Build in the same folder
javac Maze.java
java Maze

# Build is in build folder
mkdir build
javac -sourcepath src -d build src/Maze.java
java -cp build Maze