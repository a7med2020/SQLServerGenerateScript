using Microsoft.SqlServer.Management.Sdk.Sfc;
using Microsoft.SqlServer.Management.Smo;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.IO;
using Microsoft.Extensions.Configuration;
using SQLServerGenerateScript.Business;
using SQLServerGenerateScript.Enums;
using Microsoft.Extensions.DependencyInjection;

namespace SQLServerGenerateScript
{
    class Program
    {
        static void Main(string[] args)
        {
            Startup startup = new Startup();
            var services = Startup.ConfigureServices();
            var serviceProvider = services.BuildServiceProvider();
            serviceProvider.GetService<EntryPoint>().Run(args);
        }
    }
}
