using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALchangebugstatus
/// </summary>
public class DALchangebugstatus
{

    BugzDataContext dc = new BugzDataContext();

    // change the status of a bug 

    public void changeStatus(Bug p_status)
    {
        var query = from t in dc.Bugs
                    where t.pk_bug_id == p_status.pk_bug_id
                    select t;
        List<Bug> x = query.ToList();

        if (x.Count > 0)
        {
            foreach (Bug status in query)
            {
                status.fk_bugstatus = p_status.fk_bugstatus;
            }
        }

        else
        {
            throw new Exception("Could not change bugstatus!");
        }

        try
        {
            dc.SubmitChanges();
        }

        catch (Exception e)
        {
            Console.WriteLine(e);
        }

    }
}