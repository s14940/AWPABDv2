//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AWPADB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LatencyHistory
    {
        public int Id { get; set; }
        public int Id_Latency { get; set; }
        public Nullable<System.DateTime> Data { get; set; }
        public string Wartosc { get; set; }
    
        public virtual Latency Latency { get; set; }
    }
}
