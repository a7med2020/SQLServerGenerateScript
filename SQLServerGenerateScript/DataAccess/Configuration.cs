using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Text;

namespace SQLServerGenerateScript.DataAccess
{
    public class Configuration
    {
        IConfiguration _configuration;
        Configuration(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        //static string GetKeyValue(string KeyName)
        //{
        //    _configuration.GetSection("MyFirstClass").Get<MyFirstClass>();
        //}
    }


}
