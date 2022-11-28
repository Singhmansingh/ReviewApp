using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ReviewApp.Models;

using MySql.Data.MySqlClient;

namespace ReviewApp.Controllers
{
    public class CarDataController : ApiController
    {
        CarDbContext CarDb = new CarDbContext();
        [HttpGet]
        [Route("api/Cars/ListCars")]
        public IEnumerable<Car> ListCars()
        {
            MySqlConnection Conn = CarDb.AccessDatabase();
            Conn.Open();
            MySqlCommand cmd = Conn.CreateCommand();


            cmd.CommandText = "select * from cars;";
            cmd.Prepare();
            MySqlDataReader ResultSet = cmd.ExecuteReader();
            List<Car> cars = new List<Car>();

            while (ResultSet.Read())
            {
                Car car = new Car()
                {
                    CarId = Convert.ToInt32(ResultSet["carid"]),
                    CarMake = ResultSet["make"].ToString(),
                    CarColor = ResultSet["color"].ToString()

                };

                cars.Add(car);
            }


            Conn.Close();
            return cars;
        }

        [HttpPost]
        [Route("api/Cars/AddCar")]
        public string AddCar([FromBody] Car car)
        {
            MySqlConnection Conn = CarDb.AccessDatabase();
            Conn.Open();
            MySqlCommand cmd = Conn.CreateCommand();


            cmd.CommandText = "insert into cars (make, color) values (@make,@color)";
            cmd.Parameters.AddWithValue("@make", car.CarMake);
            cmd.Parameters.AddWithValue("@color", car.CarColor);
            cmd.Prepare();
            int rowsAffected = cmd.ExecuteNonQuery();

            Conn.Close();
            if (rowsAffected > 0) return "Success! car added the " + car.CarMake + "";
            else return "Unable to add car. Check your syntax";
        }
    }
}
