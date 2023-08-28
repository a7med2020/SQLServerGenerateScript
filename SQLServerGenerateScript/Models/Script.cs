using SQLServerGenerateScript.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace SQLServerGenerateScript.Models
{
    public class Script
    {
        public ScriptTypeEnum ScriptType { get; set; }
        public string Schema { get; set; }
        public string Name { get; set; }
    }
}
