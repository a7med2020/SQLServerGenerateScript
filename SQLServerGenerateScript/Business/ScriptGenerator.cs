using Microsoft.Extensions.Configuration;
using SQLServerGenerateScript.Enums;
using SQLServerGenerateScript.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQLServerGenerateScript.Business
{
    public class ScriptGenerator
    {
        private static ScriptService _scriptService;
        List<Script> _scripts;

        public ScriptGenerator(IConfiguration configuration)
        {
            _scriptService = new ScriptService(configuration);
            _scripts = new List<Script>();
        }

        List<Script> GetScriptListFromfile(ScriptTypeEnum scriptType)
        {
            string Filetext = FileManager.GetFileTextByType(scriptType);
            string[] ScriptLines = Filetext.Split(
                     new string[] { Environment.NewLine },
                         StringSplitOptions.None
                         );

            List<Script> scripts = new List<Script>();
            foreach (var scriptName in ScriptLines)
            {
                if (!string.IsNullOrEmpty(scriptName))
                {
                    string scriptNameTrimed = scriptName.Trim().Replace("[","").Replace("]","");
                    string[] ScriptFullName = scriptNameTrimed.Split( '.',StringSplitOptions.None);
                    if(ScriptFullName.Count() > 1)
                    scripts.Add(new Script() { ScriptType = scriptType, Name = ScriptFullName[1], Schema = ScriptFullName[0] });
                }
            }
            return scripts;
        }

        public List<Script> GetAllScriptList()
        {
            foreach (ScriptTypeEnum scriptType in Enum.GetValues(typeof(ScriptTypeEnum)))
            {
                _scripts.AddRange(GetScriptListFromfile(scriptType));
            }
            return _scripts;
        }

        public string GenerateScript_Create()
        {
            List<Script> scripts = GetAllScriptList();
            string allScriptContent = ScriptService.GetScriptCreate(scripts);
            FileManager.SaveTextToFile(FileManager.GetGeneratedScriptResultPath(), allScriptContent);
            return allScriptContent;
        }

        public string GenerateScript_DropAndCreate()
        {
            List<Script> scripts = GetAllScriptList();
            string allScriptContent = ScriptService.GetScriptDropAndCreate(scripts);
            FileManager.SaveTextToFile(FileManager.GetGeneratedScriptResultPath(), allScriptContent);
            return allScriptContent;
        }
    }
}
