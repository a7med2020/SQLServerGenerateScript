using Microsoft.Extensions.Configuration;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using System;
using System.Collections.Generic;
using System.Text;

namespace SQLServerGenerateScript.DataAccess
{
    public class DBAccess
    {
        private Server _srv;

        private readonly IConfiguration _configuration;
 
        public DBAccess(IConfiguration configuration) 
        {
            _configuration = configuration;
            string serverName = _configuration.GetSection("DBAccess:ServerName").Value;
            string loginUserName = _configuration.GetSection("DBAccess:LoginUserName").Value;
            string loginPassword = _configuration.GetSection("DBAccess:LoginPassword").Value;
            // Connect to the local, default instance of SQL Server. 
            _srv = new Server(serverName);
            _srv.ConnectionContext.AutoDisconnectMode = AutoDisconnectMode.NoAutoDisconnect;
            _srv.ConnectionContext.LoginSecure = false; //if using username/password
            _srv.ConnectionContext.Login = loginUserName;
            _srv.ConnectionContext.Password = loginPassword;
            _srv.ConnectionContext.Connect();
        }

        public Server GetServer()
        {
            return _srv;
        }

        public Database GetDB()
        {
            string dbName = _configuration.GetSection("DBAccess:DBName").Value;
            // Reference the database.  
            Database db = _srv.Databases[dbName];

            return db;
        }

        public Scripter GetScripter()
        {
            Scripter scrp = new Scripter(_srv);
            scrp.Options.ScriptDrops = true;
            scrp.Options.WithDependencies = true;
            scrp.Options.Indexes = true;   // To include indexes
            scrp.Options.DriAllConstraints = true;   // to include referential constraints in the script
            scrp.Options.Triggers = true;
            scrp.Options.FullTextIndexes = true;
            scrp.Options.NoCollation = false;
            scrp.Options.Bindings = true;
            scrp.Options.IncludeIfNotExists = false;
            scrp.Options.ScriptBatchTerminator = true;
            scrp.Options.ExtendedProperties = true;
            scrp.Options.SchemaQualify = true;
            scrp.Options.EnforceScriptingOptions = true;

            scrp.PrefetchObjects = true; // some sources suggest this may speed things up

            return scrp;
        }
    }
}
