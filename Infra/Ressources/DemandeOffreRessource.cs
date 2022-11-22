﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
namespace Infra.Ressources
{
    public class DemandeOffreRessource
    {
        public int IdOffre { get; set; }
        public int IdUsager { get; set; }
        public DateTime Date { get; set; }
        public bool Accepter { get; set; }
        public bool Payer { get; set; } = false;
        public string OrderId { get; set; }
    }
}
#pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
