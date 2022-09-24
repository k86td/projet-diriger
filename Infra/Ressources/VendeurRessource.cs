﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
    public class VendeurRessource
    {
        public int Id { get; private set; }
        public int IdUsager { get; set; }
        public DateTime DateAccepte { get; set; }
    }
}