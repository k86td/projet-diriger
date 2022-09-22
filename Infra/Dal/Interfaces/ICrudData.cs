using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Dal.Interfaces
{
    public interface ICrudData<T>
    {
        /// <summary>
        /// Get all the entities
        /// </summary>
        /// <returns>List of all the entities</returns>
        public ICollection<T> Get();

        /// <summary>
        /// Get a specific entity with the specified id
        /// </summary>
        /// <param name="id">The id of the entity</param>
        /// <returns>The desired entity</returns>
        public T Get(int id);

        /// <summary>
        /// Delete an entity
        /// </summary>
        /// <param name="id">The entity id</param>
        public void Delete(int id);

        /// <summary>
        /// Edit an entity
        /// </summary>
        /// <param name="id">The id of the entity</param>
        /// <param name="modification">The new entity</param>
        /// <returns></returns>
        public T Edit(int id, T modification);

        /// <summary>
        /// Create a new entity
        /// </summary>
        /// <param name="entity">The entity to be created</param>
        /// <returns>The created entity</returns>
        public T Create(T entity);
    }
}
