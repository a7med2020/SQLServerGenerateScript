using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace SQLServerGenerateScript
{
    public  class Startup
    {
          static Startup()
        {
            var builder = new ConfigurationBuilder()
                 .SetBasePath(Directory.GetCurrentDirectory())
                 .AddJsonFile("appsettings.json");

             Configuration = builder.Build();
        }

        public static IConfiguration Configuration { get; }
        public static IServiceCollection ConfigureServices()
        {
            var services = new ServiceCollection();
            services.AddTransient<EntryPoint>();
            services.AddSingleton<IConfiguration>(Configuration);
            //services.AddSingleton<IQuadraticService, QuadraticService>();
            return services;
        }
 

    }
}
