using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AWPADB.Models;

namespace AWPADB.Controllers
{
    public class ServersController : Controller
    {
        private AWPABDEntities1 db = new AWPABDEntities1();

        // GET: Servers
        public ActionResult Index()
        {
            var servers = db.Servers.Include(s => s.ServersGroup);
            return View(servers.ToList());
        }

        // GET: Servers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Servers servers = db.Servers.Find(id);
            if (servers == null)
            {
                return HttpNotFound();
            }
            return View(servers);
        }

        // GET: Servers/Create
        public ActionResult Create()
        {
            ViewBag.Id_ServersGroup = new SelectList(db.ServersGroup, "Id", "Nazwa");
            return View();
        }

        // POST: Servers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Nazwa,DNS,IP,Klaster,Opis,Aktywny,Historia,Dodany,Zmodyfikowany,Id_ServersGroup,port")] Servers servers)
        {
            if (ModelState.IsValid)
            {
                db.Servers.Add(servers);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_ServersGroup = new SelectList(db.ServersGroup, "Id", "Nazwa", servers.Id_ServersGroup);
            return View(servers);
        }

        // GET: Servers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Servers servers = db.Servers.Find(id);
            if (servers == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_ServersGroup = new SelectList(db.ServersGroup, "Id", "Nazwa", servers.Id_ServersGroup);
            return View(servers);
        }

        // POST: Servers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nazwa,DNS,IP,Klaster,Opis,Aktywny,Historia,Dodany,Zmodyfikowany,Id_ServersGroup,port")] Servers servers)
        {
            if (ModelState.IsValid)
            {
                db.Entry(servers).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_ServersGroup = new SelectList(db.ServersGroup, "Id", "Nazwa", servers.Id_ServersGroup);
            return View(servers);
        }

        // GET: Servers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Servers servers = db.Servers.Find(id);
            if (servers == null)
            {
                return HttpNotFound();
            }
            return View(servers);
        }

        // POST: Servers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Servers servers = db.Servers.Find(id);
            db.Servers.Remove(servers);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
