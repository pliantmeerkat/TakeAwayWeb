# this file contains variables for use in testing
# they will be used throught the tests for easy access in an effort to shortern
# spec file length and imrpove readablilty
# menu_1 - returns an array of hashes representing menu items
def menu_1
  menu = [{ name: :Durain, price: 1200, quantity: 10 },
          { name: :Escargot, price: 1500, quantity: 9 },
          { name: :Offle, price: 2000, quantity: 10 },
          { name: :Asparagus, price: 900, quantity: 15 },
          { name: :Birdsnest, price: 2500, quantity: 4 }]
end
