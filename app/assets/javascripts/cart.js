function CartItem(id, price, title, qty) {
  this.id = id;
  this.price = price;
  this.title = title;
  this.qty = qty;
}

function cart() {
  this.addProduct = function(id, price, title, qty) {
    var item = new CartItem(id, price, title, qty);
    this.items.push(item);
    this.saveItems();
  };

  this.removeProduct = function(id) {
    var item = this.items.find(function(el) {
      return el.id === id;
    });
    if(item) {
      var index = this.items.indexOf(item);
      this.items.splice(index, 1);
      this.saveItems();
    }
  };

  this.updateProduct = function(id, qty) {
    var item = this.items.find(function(el) {
      return el.id === id;
    });
    if(item) {
      item.qty = qty
      this.saveItems();
    }
  };

  this.all = function() {
    return this.items
  };

  this.saveItems = function() {
    Cookies.set('cart_items', JSON.stringify(this.items));
  };

  this.loadItems = function() {
    serialized = Cookies.get('cart_items');
    if(serialized) {
      this.items = JSON.parse(serialized);
    } else {
      this.items = [];
    }
  };

  this.clean = function() {
    this.items = [];
    Cookies.remove('cart_items');
  };

  this.makeFormData = function() {
    var form_data = {};
    this.items.forEach(function(item) {
      form_data[item.id] = item.qty
    });
    return form_data
  };

  this.calculatePrice = function(callback) {
    var price = 0;
    $.post({
      url: '/cart/calculate',
      data: {'form_data': JSON.stringify(this.makeFormData())}
    }, function(response) {
      price = parseFloat(response.total);
      callback(price.toFixed(2));
    });
  };

  this.loadItems();
}


