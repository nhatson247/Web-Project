using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace _20T1020670.Web
{
    public static class Converter
    {
        public static DateTime? DMYStringToDateTime(string s, string fomat = "d/M/yyyy")
        {
            try
            {
                return DateTime.ParseExact(s, fomat, CultureInfo.InvariantCulture);
            }
            catch
            {
                return null;
            }
        }
        public static UserAccount CookieToUserAccount(string cookie)
        {
            return Newtonsoft.Json.JsonConvert.DeserializeObject<UserAccount>(cookie);
        }

        public static decimal? StringToDecimal(string s)
        {
            try
            {
                return decimal.Parse(s, CultureInfo.InvariantCulture);
            }
            catch
            {
                return null;
            }
        }
    }

}