namespace ProjektNeveBackend.DTOs
{
    public class RentalCreateDto
    {
        public int CustomerId { get; set; }
        public int CarId { get; set; }
        public DateTime RentalDate { get; set; }
        public DateTime ReturnDate { get; set; }
        public string Status { get; set; }
    }
}
