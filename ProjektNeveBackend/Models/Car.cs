using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace ProjektNeveBackend.Models;

public partial class Car
{
    public int Id { get; set; }

    public string? LicensePlate { get; set; }

    public string? Brand { get; set; }

    public string? Model { get; set; }

    public int? Year { get; set; }

    public decimal? RentalPricePerDay { get; set; }

    public string? Status { get; set; }

    public int? Mileage { get; set; }

    public string Fenykep { get; set; } = null!;

    public string motor_type { get; set; } = null!;

    public int power_hp { get; set; }

    public string gearbox { get; set; } = null!;

    public int seats { get; set; }

    public string drivetrain { get; set; } = null!;

    public decimal fuelconsumption { get; set; }

    public string description { get; set; } = null!;

    public virtual ICollection<Maintenance> Maintenances { get; set; } = new List<Maintenance>();

    [JsonIgnore]
    public virtual ICollection<Rental> Rentals { get; set; } = new List<Rental>();
}
