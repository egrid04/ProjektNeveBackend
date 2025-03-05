using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjektNeveBackend.DTOs;
using ProjektNeveBackend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjektNeveBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationController : ControllerBase
    {

        // GET: api/Reservation
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Rental>>> GetAllReservations()
        {
            using (var _context = new TurbodriveContext())
            {
                return await _context.Rentals
                    .Include(r => r.Car)
                    .Include(r => r.User)
                    .ToListAsync();
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetRentalById(int id)
        {
            using (var _context = new TurbodriveContext())
            {
                var rental = await _context.Rentals.FindAsync(id);

                if (rental == null)
                {
                    return NotFound();
                }

                return Ok(rental);
            }
        }



        // POST: api/Reservation
        [HttpPost]
        public async Task<IActionResult> CreateRental([FromBody] RentalCreateDto rentalDto)
        {
            using (var _context = new TurbodriveContext())
            {
                if (rentalDto == null)
                {
                    return BadRequest("Invalid rental data.");
                }

                var car = await _context.Cars.FindAsync(rentalDto.CarId);
                if (car == null)
                {
                    return NotFound("Car not found.");
                }

                var rental = new Rental
                {
                    UserId = rentalDto.CustomerId,
                    CarId = rentalDto.CarId,
                    RentalDate = rentalDto.RentalDate,
                    ReturnDate = rentalDto.ReturnDate,
                    TotalPrice = (rentalDto.ReturnDate - rentalDto.RentalDate).Days * car.RentalPricePerDay,
                    Status = rentalDto.Status
                };

                _context.Rentals.Add(rental);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetRentalById), new { id = rental.Id }, rental);
            }
        }

        // PUT: api/Reservation/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateReservation(int id, Rental rental)
        {
            using (var _context = new TurbodriveContext())
            {
                if (id != rental.Id)
                {
                    return BadRequest("ID mismatch.");
                }

                _context.Entry(rental).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ReservationExists(id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return NoContent();
            }
        }

        // DELETE: api/Reservation/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReservation(int id)
        {
            using (var _context = new TurbodriveContext())
            {
                var rental = await _context.Rentals.FindAsync(id);
                if (rental == null)
                {
                    return NotFound();
                }

                _context.Rentals.Remove(rental);
                await _context.SaveChangesAsync();

                return NoContent();
            }
        }

        private bool ReservationExists(int id)
        {
            using (var _context = new TurbodriveContext())
            {
                return _context.Rentals.Any(e => e.Id == id);
            }
        }
    }
}
