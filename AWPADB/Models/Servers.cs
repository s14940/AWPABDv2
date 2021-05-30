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
    
    public partial class Servers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Servers()
        {
            this.BlokadyHistory = new HashSet<BlokadyHistory>();
            this.Databases = new HashSet<Databases>();
            this.Files = new HashSet<Files>();
            this.HostHistory = new HashSet<HostHistory>();
            this.Latency = new HashSet<Latency>();
            this.Latency1 = new HashSet<Latency>();
            this.LoginServers = new HashSet<LoginServers>();
            this.Procedury = new HashSet<Procedury>();
            this.ProceduryHistory = new HashSet<ProceduryHistory>();
            this.ProcesyHistory = new HashSet<ProcesyHistory>();
        }
    
        public int Id { get; set; }
        public string Nazwa { get; set; }
        public string DNS { get; set; }
        public string IP { get; set; }
        public Nullable<bool> Klaster { get; set; }
        public string Opis { get; set; }
        public Nullable<bool> Aktywny { get; set; }
        public string Historia { get; set; }
        public Nullable<System.DateTime> Dodany { get; set; }
        public Nullable<System.DateTime> Zmodyfikowany { get; set; }
        public int Id_ServersGroup { get; set; }
        public Nullable<int> port { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BlokadyHistory> BlokadyHistory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Databases> Databases { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Files> Files { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HostHistory> HostHistory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Latency> Latency { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Latency> Latency1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoginServers> LoginServers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Procedury> Procedury { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProceduryHistory> ProceduryHistory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProcesyHistory> ProcesyHistory { get; set; }
        public virtual ServersGroup ServersGroup { get; set; }
    }
}