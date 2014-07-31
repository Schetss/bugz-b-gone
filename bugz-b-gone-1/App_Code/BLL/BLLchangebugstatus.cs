using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLchangebugstatus
/// </summary>
public class BLLchangebugstatus
{
    DALchangebugstatus DALchangestatus = new DALchangebugstatus();

    public void changeStatus(Bug p_status)
    {
        DALchangestatus.changeStatus(p_status);
    }

}