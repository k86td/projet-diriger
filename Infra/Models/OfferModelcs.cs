﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Models
{
#pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.

    public class OfferModel
    {
        public int Id { get; set; }
        public UsagerModel IdVendeur { get; set; }
        public UsagerModel Destinataire { get; set; }
        public string Contenu { get; set; }
        public DateTime Date { get; set; }
    }
#pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
}
