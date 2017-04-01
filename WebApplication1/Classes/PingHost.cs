using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace WebApplication1.Classes
{
    public class PingHost
    {
        public static Boolean PingHostMethod(string args)
        {
            HttpWebResponse res = null;

            try
            {
                // Create a request to the passed URI.  
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(args);
                req.Credentials = CredentialCache.DefaultNetworkCredentials;

                // Get the response object.  
                res = (HttpWebResponse)req.GetResponse();

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}