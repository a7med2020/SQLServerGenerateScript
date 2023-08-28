using Microsoft.Extensions.Configuration;
using SQLServerGenerateScript.Business;
using SQLServerGenerateScript.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace SQLServerGenerateScript
{
    public class EntryPoint
    {
        private readonly IConfiguration _configuration;

        public EntryPoint(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public void Run(String[] args)
        {
            string a = _configuration.GetSection("DBAccess:DBName").Value;

            Console.WriteLine("Select Generation Script Type:");
            Console.WriteLine("--------------------------------");
            Console.WriteLine("1- Create");
            Console.WriteLine("2- DropAndCreate");
            Console.WriteLine("Enter number:");
            string enteredType = Console.ReadLine();
            Console.WriteLine("Processing...");

            int type = int.TryParse(enteredType, out _) ? Convert.ToInt32(enteredType) : 0;
            if (type > 0)
            {
                if (type == Convert.ToInt32(GenerationScriptTypeEnum.Create))
                {
                    ScriptGenerator scriptGenerator = new ScriptGenerator(_configuration);
                    scriptGenerator.GenerateScript_Create();
                }
                else if (type == Convert.ToInt32(GenerationScriptTypeEnum.CreateAndDrop))
                {
                    ScriptGenerator scriptGenerator = new ScriptGenerator(_configuration);
                    scriptGenerator.GenerateScript_DropAndCreate();
                }


                Console.WriteLine("Done");
            }

            Console.ReadKey();
        }
    }
}
