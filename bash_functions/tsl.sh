# Set up "tsl" function which does "tslint" using our config file
tsl() {
  tslint -c ~/.anx/tslint.json $1
}
