class RegexService {
    static checkPhone(data: string): boolean {
      // along with plus and also without it.
      const phoneRegex =
        /^(\+?\d{1,4}?[-.\s]?)?(\(?\d{1,4}?\)?[-.\s]?)?[\d-\s.]{3,15}$/;
      return phoneRegex.test(data);
    }
  
    static checkEmail(data: string): boolean {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(data);
    }
  }
  export default RegexService;