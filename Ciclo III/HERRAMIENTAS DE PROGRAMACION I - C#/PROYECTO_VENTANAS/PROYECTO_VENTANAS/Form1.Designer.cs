namespace PROYECTO_VENTANAS
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.tb_titulo = new System.Windows.Forms.TextBox();
            this.tb_men_01 = new System.Windows.Forms.TextBox();
            this.tb_men_02 = new System.Windows.Forms.TextBox();
            this.bt_dialogo_01 = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.rb_ok = new System.Windows.Forms.RadioButton();
            this.rb_ok_cancel = new System.Windows.Forms.RadioButton();
            this.rb_yes_no = new System.Windows.Forms.RadioButton();
            this.rb_yes_no_cancel = new System.Windows.Forms.RadioButton();
            this.rb_retry_cancel = new System.Windows.Forms.RadioButton();
            this.rb_abort_retry_ignore = new System.Windows.Forms.RadioButton();
            this.bt_dialogo_02 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.bt_dialogo_01);
            this.groupBox1.Controls.Add(this.tb_men_02);
            this.groupBox1.Controls.Add(this.tb_men_01);
            this.groupBox1.Controls.Add(this.tb_titulo);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(535, 118);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "TITULO Y MENSAJE";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "TITULO:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(75, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "MENSAJE 01:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 88);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(75, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "MENSAJE 02:";
            // 
            // tb_titulo
            // 
            this.tb_titulo.Location = new System.Drawing.Point(108, 19);
            this.tb_titulo.Name = "tb_titulo";
            this.tb_titulo.Size = new System.Drawing.Size(100, 20);
            this.tb_titulo.TabIndex = 3;
            // 
            // tb_men_01
            // 
            this.tb_men_01.Location = new System.Drawing.Point(108, 52);
            this.tb_men_01.Name = "tb_men_01";
            this.tb_men_01.Size = new System.Drawing.Size(254, 20);
            this.tb_men_01.TabIndex = 4;
            // 
            // tb_men_02
            // 
            this.tb_men_02.Location = new System.Drawing.Point(108, 81);
            this.tb_men_02.Name = "tb_men_02";
            this.tb_men_02.Size = new System.Drawing.Size(254, 20);
            this.tb_men_02.TabIndex = 5;
            // 
            // bt_dialogo_01
            // 
            this.bt_dialogo_01.Location = new System.Drawing.Point(369, 89);
            this.bt_dialogo_01.Name = "bt_dialogo_01";
            this.bt_dialogo_01.Size = new System.Drawing.Size(166, 23);
            this.bt_dialogo_01.TabIndex = 6;
            this.bt_dialogo_01.Text = "Mostrar Dialogo 01";
            this.bt_dialogo_01.UseVisualStyleBackColor = true;
            this.bt_dialogo_01.Click += new System.EventHandler(this.bt_dialogo_01_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.bt_dialogo_02);
            this.groupBox2.Controls.Add(this.rb_abort_retry_ignore);
            this.groupBox2.Controls.Add(this.rb_retry_cancel);
            this.groupBox2.Controls.Add(this.rb_yes_no_cancel);
            this.groupBox2.Controls.Add(this.rb_yes_no);
            this.groupBox2.Controls.Add(this.rb_ok_cancel);
            this.groupBox2.Controls.Add(this.rb_ok);
            this.groupBox2.Location = new System.Drawing.Point(12, 147);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(535, 125);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "BOTONES";
            // 
            // rb_ok
            // 
            this.rb_ok.AutoSize = true;
            this.rb_ok.Location = new System.Drawing.Point(23, 30);
            this.rb_ok.Name = "rb_ok";
            this.rb_ok.Size = new System.Drawing.Size(40, 17);
            this.rb_ok.TabIndex = 0;
            this.rb_ok.TabStop = true;
            this.rb_ok.Text = "OK";
            this.rb_ok.UseVisualStyleBackColor = true;
            // 
            // rb_ok_cancel
            // 
            this.rb_ok_cancel.AutoSize = true;
            this.rb_ok_cancel.Location = new System.Drawing.Point(23, 69);
            this.rb_ok_cancel.Name = "rb_ok_cancel";
            this.rb_ok_cancel.Size = new System.Drawing.Size(93, 17);
            this.rb_ok_cancel.TabIndex = 1;
            this.rb_ok_cancel.TabStop = true;
            this.rb_ok_cancel.Text = "OK / CANCEL";
            this.rb_ok_cancel.UseVisualStyleBackColor = true;
            // 
            // rb_yes_no
            // 
            this.rb_yes_no.AutoSize = true;
            this.rb_yes_no.Location = new System.Drawing.Point(161, 30);
            this.rb_yes_no.Name = "rb_yes_no";
            this.rb_yes_no.Size = new System.Drawing.Size(73, 17);
            this.rb_yes_no.TabIndex = 2;
            this.rb_yes_no.TabStop = true;
            this.rb_yes_no.Text = "YES / NO";
            this.rb_yes_no.UseVisualStyleBackColor = true;
            // 
            // rb_yes_no_cancel
            // 
            this.rb_yes_no_cancel.AutoSize = true;
            this.rb_yes_no_cancel.Location = new System.Drawing.Point(161, 69);
            this.rb_yes_no_cancel.Name = "rb_yes_no_cancel";
            this.rb_yes_no_cancel.Size = new System.Drawing.Size(126, 17);
            this.rb_yes_no_cancel.TabIndex = 3;
            this.rb_yes_no_cancel.TabStop = true;
            this.rb_yes_no_cancel.Text = "YES / NO / CANCEL";
            this.rb_yes_no_cancel.UseVisualStyleBackColor = true;
            // 
            // rb_retry_cancel
            // 
            this.rb_retry_cancel.AutoSize = true;
            this.rb_retry_cancel.Location = new System.Drawing.Point(287, 30);
            this.rb_retry_cancel.Name = "rb_retry_cancel";
            this.rb_retry_cancel.Size = new System.Drawing.Size(115, 17);
            this.rb_retry_cancel.TabIndex = 4;
            this.rb_retry_cancel.TabStop = true;
            this.rb_retry_cancel.Text = "RETRY / CANCEL";
            this.rb_retry_cancel.UseVisualStyleBackColor = true;
            // 
            // rb_abort_retry_ignore
            // 
            this.rb_abort_retry_ignore.AutoSize = true;
            this.rb_abort_retry_ignore.Location = new System.Drawing.Point(287, 69);
            this.rb_abort_retry_ignore.Name = "rb_abort_retry_ignore";
            this.rb_abort_retry_ignore.Size = new System.Drawing.Size(163, 17);
            this.rb_abort_retry_ignore.TabIndex = 5;
            this.rb_abort_retry_ignore.TabStop = true;
            this.rb_abort_retry_ignore.Text = "ABORT / RETRY / IGNORE";
            this.rb_abort_retry_ignore.UseVisualStyleBackColor = true;
            // 
            // bt_dialogo_02
            // 
            this.bt_dialogo_02.Location = new System.Drawing.Point(369, 92);
            this.bt_dialogo_02.Name = "bt_dialogo_02";
            this.bt_dialogo_02.Size = new System.Drawing.Size(166, 23);
            this.bt_dialogo_02.TabIndex = 6;
            this.bt_dialogo_02.Text = "Mostrar Dialogo 02";
            this.bt_dialogo_02.UseVisualStyleBackColor = true;
            this.bt_dialogo_02.Click += new System.EventHandler(this.bt_dialogo_02_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(590, 287);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "CUADRO DE DIALOGO";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button bt_dialogo_01;
        private System.Windows.Forms.TextBox tb_men_02;
        private System.Windows.Forms.TextBox tb_men_01;
        private System.Windows.Forms.TextBox tb_titulo;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button bt_dialogo_02;
        private System.Windows.Forms.RadioButton rb_abort_retry_ignore;
        private System.Windows.Forms.RadioButton rb_retry_cancel;
        private System.Windows.Forms.RadioButton rb_yes_no_cancel;
        private System.Windows.Forms.RadioButton rb_yes_no;
        private System.Windows.Forms.RadioButton rb_ok_cancel;
        private System.Windows.Forms.RadioButton rb_ok;
    }
}

