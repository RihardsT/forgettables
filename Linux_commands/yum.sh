# Show available package versions
yum --showduplicates list PACKAGE | expand
# Install specific version
yum install PACKAGE-VERSION
