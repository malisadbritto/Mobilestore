using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class CartItem
    {
    //constructors that create an empty CartItem object or one with values
    public CartItem() { }
    public CartItem(Product product, int quantity)
    {
        this.Product = product;
        this.Quantity = quantity;
    }
    //public properties for a CartItem object
    public Product Product { get; set; }
    public int Quantity { get; set; }
    //method that adds the quantity to the current quantity
    public void AddQuantity(int quantity)
    {
        this.Quantity += quantity;
    }
    //method that formats an item's name, quantity, and price in one line
    public string Display()
    {
        string displayString = string.Format("{0} ({1} at {2} {3} {4})",
        Product.MobileName,
        Quantity.ToString(),
        Product.Price.ToString("c"),
        Product.Version,
        Product.ImageFile);
        return displayString;
    }

}
