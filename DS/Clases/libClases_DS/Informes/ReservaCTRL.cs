using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;

namespace libClases_DS.Informes
{
    public class ReservaCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public GridView grdReservas { get; set; }
        public string error { get; private set; }
        public Int32 codigo { get; set; }

        #endregion

        #region Metodos
        public bool LlenarGridPorCriterio()
        {
            if (grdReservas == null)
            {
                error = "No definió el grid de reservas";
                return false;

            }
            SQL = "SP_Consultar_ReservaXCodigo";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdReservas;
            oGrid.AgregarParametro("@Codigo", codigo);
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdReservas = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }


        #endregion

    }
}
