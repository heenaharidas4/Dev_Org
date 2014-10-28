@isTest private class TestCeltoFarhn1
{
    static testmethod void myUnittest()
    {
        CeltoFarhn test = new CeltoFarhn();
        test.cvalue = 32;
        test.saveConvert();
        System.assertEquals(89.6,test.fvalue);
        }
}