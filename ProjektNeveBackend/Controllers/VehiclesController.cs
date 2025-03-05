using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjektNeveBackend.Models;
using Microsoft.EntityFrameworkCore;

namespace ProjektNeveBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarController : ControllerBase
    {
        [HttpGet("CarDetails/{token},{id}")]
        public async Task<IActionResult> GetCarDetails(string token, int id)
        {
            using var cx = new TurbodriveContext();
            try
            {
                if (!Program.LoggedInUsers.ContainsKey(token) || Program.LoggedInUsers[token].Jogosultsag != 9)
                    return BadRequest("Nincs jogod hozzá!");

                var car = await cx.Cars.FirstOrDefaultAsync(f => f.Id == id);
                return car != null ? Ok(car) : NotFound("Nincsenek autók az adatbázisban.");
            }
            catch (Exception ex)
            {
                return BadRequest($"Hiba történt: {ex.InnerException?.Message ?? ex.Message}");
            }
        }

        [HttpGet("CarAll/{token}")]
        public async Task<IActionResult> GetCarDetails(string token)
        {
            using var cx = new TurbodriveContext();
            try
            {
                if (!Program.LoggedInUsers.ContainsKey(token) || Program.LoggedInUsers[token].Jogosultsag != 9)
                    return BadRequest("Nincs jogod hozzá!");

                var cars = await cx.Cars.ToListAsync();
                return cars.Any() ? Ok(cars) : NotFound("Nincsenek autók az adatbázisban.");
            }
            catch (Exception ex)
            {
                return BadRequest($"Hiba történt: {ex.InnerException?.Message ?? ex.Message}");
            }
        }

        [HttpGet("Categories/{token}")]
        public IActionResult GetCarCategories(string token, [FromQuery] string? category = null)
        {
            using (var cx = new TurbodriveContext())
            {
                try
                {
                    if (Program.LoggedInUsers.ContainsKey(token) && Program.LoggedInUsers[token].Jogosultsag == 9)
                    {
                        var cars = cx.Cars
                            .AsEnumerable()
                            .Select(c => new
                            {
                                c.Id,
                                c.Brand,
                                c.Model,
                                c.RentalPricePerDay,
                                c.Status,
                                c.Fenykep,
                                Category = c.RentalPricePerDay switch
                                {
                                    < 20000 => "cheap",
                                    >= 20000 and < 30000 => "comfort",
                                    >= 40000 and <= 60000 => "exclusive",
                                    >= 100000 => "luxus",
                                    _ => "egyéb"
                                }
                            })
                            .Where(c => string.IsNullOrEmpty(category) || c.Category.Equals(category, StringComparison.OrdinalIgnoreCase))
                            .ToList();

                        return Ok(cars);
                    }
                    else
                    {
                        return BadRequest("Nincs jogod hozzá!");
                    }
                }
                catch (Exception ex)
                {
                    return BadRequest(ex.InnerException?.Message);
                }
            }
        }

        [HttpGet("{token},{id}")]
        public async Task<IActionResult> Get(string token, int id)
        {
            using var cx = new TurbodriveContext();
            try
            {
                if (!Program.LoggedInUsers.ContainsKey(token) || Program.LoggedInUsers[token].Jogosultsag != 9)
                    return BadRequest("Nincs jogod hozzá!");

                var car = await cx.Cars.AsNoTracking().FirstOrDefaultAsync(c => c.Id == id);
                return car != null ? Ok(car) : NotFound("Nem található ilyen autó.");
            }
            catch (Exception ex)
            {
                return BadRequest($"Hiba történt: {ex.InnerException?.Message ?? ex.Message}");
            }
        }

        [HttpPost("{token}")]
        public async Task<IActionResult> Post(string token, [FromBody] Car car)
        {
            using var cx = new TurbodriveContext();
            try
            {
                if (!Program.LoggedInUsers.ContainsKey(token) || Program.LoggedInUsers[token].Jogosultsag != 9)
                    return BadRequest("Nincs jogod hozzá!");

                if (car == null)
                    return BadRequest("Hibás autóadatok.");

                await cx.Cars.AddAsync(car);
                await cx.SaveChangesAsync();
                return Ok("Új autó sikeresen felvéve.");
            }
            catch (Exception ex)
            {
                return BadRequest($"Hiba történt: {ex.InnerException?.Message ?? ex.Message}");
            }
        }

        [HttpPut("{token}")]
        public async Task<IActionResult> Put(string token, [FromBody] Car car)
        {
            using (var cx = new TurbodriveContext())
            {
                try
                {
                    if (!Program.LoggedInUsers.ContainsKey(token) || Program.LoggedInUsers[token].Jogosultsag != 9)
                        return BadRequest("Nincs jogod hozzá!");

                    var existingCar = await cx.Cars.FindAsync(car.Id);
                    if (existingCar == null)
                        return NotFound("Az autó nem található.");

                    cx.Entry(existingCar).CurrentValues.SetValues(car);
                    await cx.SaveChangesAsync();
                    return Ok("Az autó adatai módosítva.");
                }
                catch (Exception ex)
                {
                    return BadRequest($"Hiba történt: {ex.InnerException?.Message ?? ex.Message}");
                }
            }
        }

        [HttpDelete("{token},{id}")]
        public async Task<IActionResult> Delete(string token, int id)
        {
            using (var cx = new TurbodriveContext())
            {
                try
                {
                    if (!Program.LoggedInUsers.ContainsKey(token) || Program.LoggedInUsers[token].Jogosultsag != 9)
                        return BadRequest("Nincs jogod hozzá!");

                    var car = await cx.Cars.FindAsync(id);
                    if (car == null)
                        return NotFound("Az autó nem található.");

                    cx.Cars.Remove(car);
                    await cx.SaveChangesAsync();
                    return Ok("Az autó sikeresen törölve.");
                }
                catch (Exception ex)
                {
                    return BadRequest($"Hiba történt: {ex.InnerException?.Message ?? ex.Message}");
                }
            }
        }
    }
}