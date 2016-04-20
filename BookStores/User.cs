using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStores
{
    public class User
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public int Id { get; set; }

        public User(string Name, string Email, int Id)
        {
            this.Email = Email;
            this.Id = Id;
            this.Name = Name;
        }
        public User()
        {

        }
    }
}