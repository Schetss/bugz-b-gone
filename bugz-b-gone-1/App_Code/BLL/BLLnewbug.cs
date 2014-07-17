using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLnewbug
/// </summary>
public class BLLnewbug
{
    DALnewbug DALnewbug = new DALnewbug();

    public void insertNewBug(Bug p_newbug)
    {
        DALnewbug.insertNewBug(p_newbug);
    }
}