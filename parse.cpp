#include <iostream>
#include <vector>
using namespace std;

int main(int argc, char *argv[]) {
    vector<vector<pair<int, int>>> v(16, vector<pair<int, int>>());
    vector<int> mx(100, 0);

    string s;

    char c;

    while (cin >> s) {
        int ej, dia, niv;
        cin >> c >> ej >> c >> niv >> c >> niv;
        cin >> c >> dia >> c >> dia;
        cin >> s;
        v[dia].push_back({ej, niv});
    }

    for (int i = 1; i <= 15; ++i) {
        cout << "# DIA " << i << endl;
        for (auto p : v[i]) {
            cout << "    - E" << p.first << "\tN" << p.second << endl;
            if (p.second < mx[p.first]) {
                cout << "ERROR ej" << p.first << ' ' << mx[p.first]
                    << " -> "
                    << p.second << endl;
            }
            mx[p.first] = p.second;
        }
    }

    cout << "ASSOLITS" << endl;

    for (int i = 0; i < mx.size(); ++i) {
        if (mx[i]) cout << "ej " << i << "\tN" << mx[i] << endl;
    }

    return 0;
}
