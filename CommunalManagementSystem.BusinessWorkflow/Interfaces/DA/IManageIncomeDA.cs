﻿using CommunalManagementSystem.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommunalManagementSystem.BusinessWorkflow.Interfaces.DA
{
    public interface IManageIncomeDA
    {
        Task<IEnumerable<Income>> GetAllAsync();
        Task<Income?> GetByIdAsync(Guid id);
        Task<Guid> CreateAsync(Income income);
        Task<bool> UpdateAsync(Guid id, Income updatedIncome);
        Task<bool> DeleteAsync(Guid id);
    }
}
