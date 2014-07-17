using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALnewbug
/// </summary>
public class DALnewbug
{
    BugzDataContext dc = new BugzDataContext();

    public void insertNewBug(Bug p_newbug)
    {
        dc.Bugs.InsertOnSubmit(p_newbug);
        dc.SubmitChanges();
    }
}