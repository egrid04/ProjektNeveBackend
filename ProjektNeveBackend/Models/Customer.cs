﻿using System;
using System.Collections.Generic;

namespace ProjektNeveBackend.Models;

public partial class Customer
{
    public int UserId { get; set; }

    public string? Name { get; set; }

    public string? Email { get; set; }

    public string? PhoneNumber { get; set; }

    public string? DriverLicense { get; set; }

    public string? Address { get; set; }

    public DateTime? RegistrationDate { get; set; }

    public virtual Client User { get; set; } = null!;
}
