using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLbugoverview
/// </summary>
public class BLLbugoverview
{
    DALbugoverview DALbugoverview = new DALbugoverview();

    public List<Bug> getBug(Bug p_bug)
    {
        return DALbugoverview.getBug(p_bug);
    }
}