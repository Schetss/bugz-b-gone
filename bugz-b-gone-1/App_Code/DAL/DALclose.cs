using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALclose
/// </summary>
public class DALclose
{
	private BugzDataContext dc = new BugzDataContext();

    public void closeBug(Bug p_close)
    {
        var query = from t in dc.Bugs
                    where t.pk_bug_id == p_close.pk_bug_id
                    select t;

        List<Bug> x = query.ToList();

        if(x.Count > 0)
        {
            foreach(Bug close in query)
            {
                close.openclosed = 0;
            }
        }

        else 
        {
            throw new Exception("Could not close bug!");
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