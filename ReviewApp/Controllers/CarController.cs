using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ReviewApp.Models;
namespace ReviewApp.Controllers
{
    public class CarController : Controller
    {
        // GET: CarData
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult New()
        {
            return View();
        }

        public ActionResult List()
        {
            CarDataController controller = new CarDataController();
            IEnumerable<Car> Cars = controller.ListCars();
            return View(Cars);
        }

        [HttpPost]
        public ActionResult Create(string CarMake, string CarColor)
        {
            Car MyCar = new Car() { CarMake = CarMake, CarColor = CarColor };
            CarDataController controller = new CarDataController();
            controller.AddCar(MyCar);
            return RedirectToAction("New");
        }
        
            
        
    }
}