function Day(date, day, month, year) {
    if (date.toString().length === 1) {
        this.date = '0' + date;
    } else {
        this.date = date;
    }
    if (month.toString().length === 1) {
        this.month = '0' + month;
    } else {
        this.month = month;
    }
    this.day = day;
    this.year = year;
}

function getNthDate(i) {
    var tomorrow = new Date();
    tomorrow.setDate(i);
    return tomorrow;
}

function getThreeMonthDays() {
    var days = [];
    var today = new Date();
    var endIndexMonth = (today.getMonth() + 3) % 12;
    var currentIndexMonth = getNthDate(1).getMonth();
    var i = 2 - getNthDate(1).getDay();
    var day = getNthDate(i++);

    while (currentIndexMonth !== endIndexMonth) {
        days.push(new Day(day.getDate(), day.getDay(), day.getMonth() + 1, day.getFullYear()));
        day = getNthDate(i);
        currentIndexMonth = day.getMonth();
        ++i;
    }
    while (days[days.length - 1].day !== 0) {
        days.push(new Day(day.getDate(), day.getDay(), day.getMonth() + 1, day.getFullYear()));
        day = getNthDate(i);
        ++i;
    }
    return days;
}

function markCurrentDay() {
    var today = new Date();
    var date = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getYear() + 1900;
    if (date.toString().length === 1) {
        date = '0' + date;
    }
    if (month.toString().length === 1) {
        month = '0' + month;
    }
    var selector = '.fulldate_' + year + '-' + month + '-' + date;
    var element = document.querySelector(selector);
    element.className += ' currentDay';
}

function getThreeMonths() {
    var months = ['CALENDAR_MONTH_JANUARY', 'CALENDAR_MONTH_FEBRUARY', 'CALENDAR_MONTH_MARCH',
        'CALENDAR_MONTH_APRIL', 'CALENDAR_MONTH_MAY', 'CALENDAR_MONTH_JUNE', 'CALENDAR_MONTH_JULY',
        'CALENDAR_MONTH_AUGUST', 'CALENDAR_MONTH_SEPTEMBER', 'CALENDAR_MONTH_OCTOBER',
        'CALENDAR_MONTH_NOVEMBER', 'CALENDAR_MONTH_DECEMBER'];

    var days = getThreeMonthDays();
    var length = days.length / 7;
    var result = [];
    var week = 7;
    var currentYear = getNthDate(1).getYear() + 1900;
    var currentIndexMonth = getNthDate(1).getMonth();
    for (var i = 0; i < length; ++i) {

        if (days[week - 1].date <= 7) {
            result.push({month: months[currentIndexMonth], year: currentYear});
            currentIndexMonth = (++currentIndexMonth) % 12;
            if (currentIndexMonth === 0) {
                ++currentYear;
            }
        } else {
            result.push({});
        }

        week = week + 7;

    }
    return result;
}

function dateTimeFormat(data) {
    var months = ['CALENDAR_MONTH_CASE_JANUARY', 'CALENDAR_MONTH_CASE_FEBRUARY', 'CALENDAR_MONTH_CASE_MARCH',
        'CALENDAR_MONTH_CASE_APRIL', 'CALENDAR_MONTH_CASE_MAY', 'CALENDAR_MONTH_CASE_JUNE', 'CALENDAR_MONTH_CASE_JULY',
        'CALENDAR_MONTH_CASE_AUGUST', 'CALENDAR_MONTH_CASE_SEPTEMBER', 'CALENDAR_MONTH_CASE_OCTOBER',
        'CALENDAR_MONTH_CASE_NOVEMBER', 'CALENDAR_MONTH_CASE_DECEMBER'];

    for (var i = 0; i < data.length; ++i) {
        data[i].time = moment(data[i].date).format('HH:mm');
        data[i].dateNum = moment(data[i].date).format('DD');
        data[i].month = months[moment(data[i].date).month()];
        data[i].year = moment(data[i].date).format('YYYY');
    }

}


function colorDayItems(data) {
    var regexp = new RegExp('\\d\\d\\d\\d-\\d\\d-\\d\\d');
    for (var i = 0; i < data.length; ++i) {
        var selector = '.fulldate_' + data[i].date.match(regexp)[0];
        var element = document.querySelector(selector);

        var hasClassWillGo = element.classList.contains('willGo');
        var hasClassWillNotGo = element.classList.contains('willNotGo');

        if (hasClassWillGo === false && hasClassWillNotGo === false) {
            if (data[i].isSubscribe === true) {
                element.className += ' willGo';
            } else {
                element.className += ' willNotGo';
            }
        }

        if (hasClassWillGo === false && hasClassWillNotGo === true) {
            if (data[i].isSubscribe === true) {
                element.className += ' willGo';
            }
        }
    }
}

function addTrainerIcon (data) {
    var regexp = new RegExp('\\d\\d\\d\\d-\\d\\d-\\d\\d');
    for (var i = 0; i < data.length; ++i) {
        var selector = '.fulldate_' + data[i].date.match(regexp)[0];
        var element = document.querySelector(selector);
        var icon = element.getElementsByClassName('isTrainer')[0];

        var hasClassIsTrainer = icon.classList.contains('glyphicon');

        if (data[i].isTrainer === true && hasClassIsTrainer === false) {
            icon.className += ' glyphicon glyphicon-user';
        }
    }
}

function dayDescription(data) {
    var description = [];
    var indexResponse = 0;
    var j = 2 - getNthDate(1).getDay();

    var prevDay = getNthDate(j);
    j = j + 7;
    var day = getNthDate(j);

    for (var i = 0; i < 14; ++i) {
        var flag = 0;
        description[i] = new Array();

        if (data.length > indexResponse) {
            while (Date.parse(moment(prevDay).format('YYYY-MM-DD')) <= Date.parse(moment(data[indexResponse].date).format('YYYY-MM-DD')) &&
            Date.parse(moment(day).format('YYYY-MM-DD')) > Date.parse(moment(data[indexResponse].date).format('YYYY-MM-DD'))) {
                if (data[indexResponse].isSubscribe == true) {
                    description[i].push(data[indexResponse]);
                    flag = 1;
                }

                ++indexResponse;

                if (data.length == indexResponse) {
                    break;
                }
            }
        }

        prevDay = getNthDate(j);
        j = j + 7;
        day = getNthDate(j);
    }

    return description;
}