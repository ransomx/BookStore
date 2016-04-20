using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStores
{

    public class Book
    {
        protected string _author, _isbn, _title;
        protected int _price;

        public Book(string Author, string ISBN, string Title, int Price)
        {
            this.Author = Author;
            this.ISBN = ISBN;
            this.Title = Title;
            this.Price = Price;
        }

        public string ISBN
        {
            get; set;
        }

        public string Title
        {
            get; set;
        }

        public string Author
        {
            get; set;
        }

        public int Price
        {
            get; set;
        }

    }
}