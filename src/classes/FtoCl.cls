public with sharing class FtoCl {

    public Double fvalue { get; set; }

    public Double cvalue { get; set; }

    public PageReference saveConvert() {
          fvalue = 32 + (9.0 / 5) * cvalue; 
        return null;
    }

}