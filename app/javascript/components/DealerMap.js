import React from 'react'
import { Chart } from 'react-google-charts';
import PropTypes from "prop-types"

class DealerMap extends React.Component {
  render () {
    {
      var data = [['Lat', 'Long', 'Name']]
      this.props.mapdata.map((item) => data.push([Number(item[0]), Number(item[1]), item[2]]))
    }
    return (
      <React.Fragment>
        <div className={'my-pretty-chart-container'}>
          <div>
            <Chart
              width={'100%'}
              height={'500px'}
              chartType="GeoChart"
              data={data}
              options={{
                region: 'auto',
                displayMode: 'markers',
                colorAxis: { colors: ['green', 'blue'] },
              }}
              // Note: you will need to get a mapsApiKey for your project.
              // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
              mapsApiKey={this.props.map_api_key}
            />
          </div>
        </div>
      </React.Fragment>
    );
  }
}

DealerMap.propTypes = {
  mapdata: PropTypes.arrayOf(PropTypes.array),
  map_api_key: PropTypes.string
};
export default DealerMap
