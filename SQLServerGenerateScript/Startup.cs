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
        public static IServiceCollection ConfigureServices()
        {
            var services = new ServiceCollection();
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: false);
            IConfiguration configuration = builder.Build();

            services.AddTransient<EntryPoint>();
            services.AddSingleton<IConfiguration>(configuration);
            //services.AddSingleton<IQuadraticService, QuadraticService>();
            return services;
        }
 

    }
}
