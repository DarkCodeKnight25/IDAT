using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PROYECTO_VENTANAS
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void tb_tecla_KeyPress(object sender, KeyPressEventArgs e)
        {
            lb_tecla.Text = e.KeyChar.ToString();
        }

        private void tb_tecla_KeyDown(object sender, KeyEventArgs e)
        {
            chb_alt.Checked = false;
            chb_shift.Checked = false;
            chb_ctrl.Checked = false;

            if (e.Alt)
            {
                chb_alt.Checked = true;
            }
            if (e.Shift)
            {
                chb_shift.Checked = true;
            }
            if (e.Control)
            {
                chb_ctrl.Checked = true;
            }

            lb_codigo.Text = e.KeyCode.ToString();
            lb_datos.Text = e.KeyData.ToString();
            lb_valor.Text = e.KeyValue.ToString();

        }
    }
}
