/*
    Copyright 2016 Baptiste Wicht

    This file is part of Acquisition.

    Acquisition is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Acquisition is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Acquisition.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <sstream>

#include "auto_price.hpp"

namespace {

bool ends_with(const std::string& str, const std::string& end) {
    if (str.length() >= end.length()) {
        return str.compare (str.length() - end.length(), end.length(), end) == 0;
    } else {
        return false;
    }
}

bool is_double(const std::string& s){
    std::istringstream iss(s);
    double d;
    char c;
    return iss >> d && !(iss >> c);
}

double to_double(const std::string& s){
    std::istringstream iss(s);
    double d;
    iss >> d;
    return d;
}

} //end of anonymous namespace

bool is_auto_priced(const std::string& title){
    if(ends_with(title, "c")){
        return is_double({title.begin(), title.begin() + title.size() - 1});
    } else if(ends_with(title, "f")){
        return is_double({title.begin(), title.begin() + title.size() - 1});
    } else if(ends_with(title, "alt")){
        return is_double({title.begin(), title.begin() + title.size() - 3});
    } else if(ends_with(title, "alc")){
        return is_double({title.begin(), title.begin() + title.size() - 3});
    } else if(ends_with(title, "ex")){
        return is_double({title.begin(), title.begin() + title.size() - 2});
    }

    return false;
}

Buyout get_auto_price(const std::string& title){
    if(ends_with(title, "c")){
        return {to_double({title.begin(), title.begin() + title.size() - 1}), BUYOUT_TYPE_BUYOUT, CURRENCY_CHAOS_ORB, {}};
    } else if(ends_with(title, "f")){
        return {to_double({title.begin(), title.begin() + title.size() - 1}), BUYOUT_TYPE_BUYOUT, CURRENCY_ORB_OF_FUSING, {}};
    } else if(ends_with(title, "alt")){
        return {to_double({title.begin(), title.begin() + title.size() - 3}), BUYOUT_TYPE_BUYOUT, CURRENCY_ORB_OF_ALTERATION, {}};
    } else if(ends_with(title, "alc")){
        return {to_double({title.begin(), title.begin() + title.size() - 3}), BUYOUT_TYPE_BUYOUT, CURRENCY_ORB_OF_ALCHEMY, {}};
    } else if(ends_with(title, "ex")){
        return {to_double({title.begin(), title.begin() + title.size() - 2}), BUYOUT_TYPE_BUYOUT, CURRENCY_EXALTED_ORB, {}};
    }

    return {};
}
