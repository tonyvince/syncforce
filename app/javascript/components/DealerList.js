import React from 'react'
import PropTypes from 'prop-types'
class DealerList extends React.Component {
  render () {
    return (
      <React.Fragment>
        <table>
          <thead>
            <tr>
              <th>{this.props.idHeading}</th>
              <th>{this.props.nameHeading}</th>
              <th>{this.props.addressHeading}</th>
            </tr>
          </thead>
          <tbody>
            {this.props.dealers.map((dealer) => {
              return (
                <tr key={dealer.salesforce_id}>
                  <td>{dealer.salesforce_id}</td>
                  <td>{dealer.name}</td>
                  <td>{dealer.street + " " + dealer.city + " " + dealer.state + " " + + dealer.zipcode + " " + dealer.country}</td>
                </tr>
              )
            }) }
          </tbody>
        </table>
      </React.Fragment>
    );
  }
}

DealerList.propTypes = {
  dealers: PropTypes.arrayOf(PropTypes.object),
  idHeading: PropTypes.string,
  nameHeading: PropTypes.string,
  addressHeading: PropTypes.string,
};
export default DealerList
