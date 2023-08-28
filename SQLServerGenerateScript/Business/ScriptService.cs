using Microsoft.Extensions.Configuration;
using Microsoft.SqlServer.Management.Sdk.Sfc;
using Microsoft.SqlServer.Management.Smo;
using SQLServerGenerateScript.DataAccess;
using SQLServerGenerateScript.Enums;
using SQLServerGenerateScript.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQLServerGenerateScript.Business
{
    public class ScriptService
    {
        private static DBAccess _dbAccess;
        private static Database _db;
        private static Scripter _scrp;
          
        public ScriptService(IConfiguration configuration)
        {
            _dbAccess = new DBAccess(configuration);
            _db = _dbAccess.GetDB();
            _scrp = new Scripter(_dbAccess.GetServer());
        }

        public static Urn GetScriptUrn(ScriptTypeEnum scriptType, string ScriptName, string schema)
        {
            switch (scriptType)
            {
                case ScriptTypeEnum.Table:
                    return _db.Tables[ScriptName, schema] != null ? _db.Tables[ScriptName, schema].Urn : null;
                case ScriptTypeEnum.StoredProcedure:
                    return _db.StoredProcedures[ScriptName, schema] != null ? _db.StoredProcedures[ScriptName, schema].Urn : null;
                case ScriptTypeEnum.UserDefinedFunction:
                    return _db.UserDefinedFunctions[ScriptName, schema] != null ? _db.UserDefinedFunctions[ScriptName, schema].Urn : null;
                case ScriptTypeEnum.Trigger:
                    return _db.Triggers[ScriptName] != null ? _db.Triggers[ScriptName].Urn : null;
                case ScriptTypeEnum.View:
                    return _db.Views[ScriptName, schema] != null ? _db.Views[ScriptName, schema].Urn : null;
                default:
                    return "";
                     
            }
        }

        public static List<Urn> GetScriptsUrns(List<Script> scripts)
        {
            var urns = new List<Urn>();

            foreach (var script in scripts)
            {
                var urn = GetScriptUrn(script.ScriptType, script.Name, script.Schema);
                if(urn != null)
                urns.Add(urn);
            }

            return urns;
        }

        public static string GetScriptCreate(List<Script> scripts)
        {
            StringBuilder builder = new StringBuilder();
            System.Collections.Specialized.StringCollection sc = _scrp.Script(GetScriptsUrns(scripts).ToArray());
            foreach (string st in sc)
            {
                // It seems each string is a sensible batch, and putting GO after it makes it work in tools like SSMS.
                // Wrapping each string in an 'exec' statement would work better if using SqlCommand to run the script.
                builder.AppendLine(st);
                builder.AppendLine("GO");
            }
            return builder.ToString();
        }

        public static string GetScriptDropAndCreate(List<Script> scripts)
        {
            StringBuilder builder = new StringBuilder();
            System.Collections.Specialized.StringCollection sc = _scrp.Script(GetScriptsUrns(scripts).ToArray());

            foreach (var script in scripts)
            {
                builder.AppendLine(ScriptTemplate.GetDropIfExist(script.Name, script.Schema, script.ScriptType));
                builder.AppendLine("GO");
            }

            builder.AppendLine("---===================================================================================================================================");
            builder.AppendLine("---===================================================================================================================================");

            foreach (string st in sc)
            {
                builder.AppendLine(st);
                builder.AppendLine("GO");
            }
            return builder.ToString();
        }

    }
}
