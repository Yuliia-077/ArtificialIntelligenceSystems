using System;
using System.Collections.Generic;
using System.Text;

namespace Lab5Task3.Entities
{
    public class Symbol
    {
        public List<int> Picture { get; set; }
        public int Signal { get; set; }

        public Symbol(List<int> picture, int signal)
        {
            Picture = new List<int>();
            Picture.Add(1);
            Picture.AddRange(picture);
            Signal = signal;
        }

        public int Hebba()
        {
            List<double> w = new List<double>();
            foreach (var item in Picture)
            {
                w.Add(0);
            }
            int t = -99;
            while(Signal!=t)
            {
                AdjactWeight(w);
                t = StopCondition(w);
            }
            return t;
        }

        private void AdjactWeight(List<double> w_old)
        {
            for(int i = 0; i < w_old.Count; i++)
            {
                int delta = 0;
                if (Picture[i] * Signal == 1) delta = 1;
                else if (Picture[i] == 0) delta = 0;
                else if (Picture[i] != 0 && Signal == 0) delta = -1;
                w_old[i] += (double)delta;
            }
        }

        private int StopCondition(List<double> w)
        {
            double s = 0;
            for (int i = 1; i < w.Count; i++)
            {
                s += Picture[i] * w[i];
            }
            s += w[0];
            int t = 0;
            if (s > 0) t = 1;
            else t = 0;
            return t;
        }


    }
}
