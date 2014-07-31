using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DALbugoverview
/// </summary>
public class DALbugoverview
{
    BugzDataContext dc = new BugzDataContext();

    public List<Bug> getBug(Bug p_bug)
    {
        var query = from t in dc.Bugs
                    where t.pk_bug_id == p_bug.pk_bug_id
                    select t;
        List<Bug> x = query.ToList();

        return x;
    }

}