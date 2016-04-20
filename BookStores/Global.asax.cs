using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace BookStores
{
    public class Global : HttpApplication
    {
        

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["NoOfVisitors"] = 0;
            Application["NoOfOnline"] = 0;
        }

        void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["NoOfOnline"] = (int)Application["NoOfOnline"] - 1;
            Application.UnLock();
        }

        void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["NoOfVisitors"] = (int)Application["NoOfVisitors"] + 1;
            Application["NoOfOnline"] = (int)Application["NoOfOnline"] + 1;
            Application.UnLock();
        }

    }
}